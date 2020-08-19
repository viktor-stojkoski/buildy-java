import { Component, OnInit, ViewChild } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { forkJoin, iif, of } from 'rxjs';
import { switchMap, takeUntil, tap, mergeMap } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { ComputerMapper } from 'src/app/helpers/mappers/computer.mapper';
import { IComputerComponentNameDto, IComputerDto, IPart } from 'src/app/models/computer.interfaces';
import { ComputerService } from 'src/app/services/computer/computer.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { SaveBuildDialogComponent } from '../dialogs/save-build-dialog/save-build-dialog.component';
import { AuthService } from 'src/app/services/auth/auth.service';
import { IUserDto } from 'src/app/models/user.interfaces';
import { SaveComputerRequest, ComputerComponentRequest } from 'src/app/models/requests/computer.requests';
import { ComputerComponentName } from 'src/app/models/computer.models';

@Component({
  selector: 'app-build',
  templateUrl: './build.component.html',
  styleUrls: ['./build.component.scss']
})
export class BuildComponent extends DestroyBaseComponent implements OnInit {
  private computerId: number;
  private computerName: string;

  public computerComponentNames: IComputerComponentNameDto[];
  public components: IPart[];
  public totalPrice: number;

  public displayedColumns = ['part', 'selectedPart', 'price', 'actions'];
  public dataSource: MatTableDataSource<IPart>;

  public isSaveButtonDisabled = true;

  public formGroup: FormGroup;

  @ViewChild(MatSort, {static: true}) public sort: MatSort;

  constructor(
    private computerService: ComputerService,
    private route: ActivatedRoute,
    private router: Router,
    private fb: FormBuilder,
    public dialog: MatDialog,
    private authService: AuthService) {
    super();
  }

  public ngOnInit(): void {
    this.formGroup = this.fb.group({
      computerName: ['', Validators.required]
    });

    this.route.paramMap
      .pipe(
        tap(params => this.computerId = Number.parseInt(params.get('id'))),
        switchMap(() => forkJoin([
          this.computerService.getComputerComponentNames(),
          iif(
            () => !isNaN(this.computerId),
            this.computerService.getOursComputer(this.computerId),
            of(null)
          )
        ])),
        takeUntil(this.destroyed),
      )
      .subscribe({
        next: ([computerComponentNames, computer]) => {
          this.computerComponentNames = computerComponentNames;
          this.drawTable(computer);
        },
        error: error => console.error(error)
      });
  }

  public addOrEditItem(item: IPart): void {
    const partName = this.computerComponentNames
      .find(x => x.longName === item.part)
      .shortName
      .toLocaleLowerCase();

    this.router.navigate([`build/add/${partName}`]);
  }

  public removePart(item: IPart): void {
    const partName = this.computerComponentNames
      .find(x => x.longName === item.part)
      .shortName;

    sessionStorage.removeItem(partName);

    this.drawTable(null);
  }

  public openSaveBuildDialog(): void {
    if (this.getCurrentUser() === null) {
      this.router.navigate(['login']);
      return;
    }
    const dialogRef = this.dialog.open(SaveBuildDialogComponent, {
      width: '250px',
      data: { computerName: '' }
    });

    dialogRef
      .afterClosed()
      .pipe(
        mergeMap(result => {
          if (!result) {
            return of();
          }

          const computerName = result;
          const userUid = this.getCurrentUser().uid;

          const cpu: ComputerComponentRequest = { partUid: this.components.find(c => c.part === ComputerComponentName.CPU.longName).uid };
          const gpu: ComputerComponentRequest = { partUid:  this.components.find(c => c.part === ComputerComponentName.GPU.longName).uid };
          const ram: ComputerComponentRequest = { partUid:  this.components.find(c => c.part === ComputerComponentName.RAM.longName).uid };
          const storage: ComputerComponentRequest =
            { partUid:  this.components.find(c => c.part === ComputerComponentName.Storage.longName).uid };
          const psu: ComputerComponentRequest =
            { partUid:  this.components.find(c => c.part === ComputerComponentName.PSU.longName).uid };
          const pcCase: ComputerComponentRequest =
            { partUid:  this.components.find(c => c.part === ComputerComponentName.Case.longName).uid };
          const motherboard: ComputerComponentRequest =
            { partUid:  this.components.find(c => c.part === ComputerComponentName.Motherboard.longName).uid };
          const cooling: ComputerComponentRequest =
            { partUid:  this.components.find(c => c.part === ComputerComponentName.Cooling.longName).uid };

          const saveComputerRequest: SaveComputerRequest = {
            userUid,
            computerName,
            cpu,
            gpu,
            ram,
            storage,
            psu,
            pcCase,
            motherboard,
            cooling
          };

          return this.computerService.saveComputer(saveComputerRequest);
        })
      )
      .subscribe({
        next: result => {
          console.log(result);
        },
        error: error => console.error(error)
      });
  }

  public resetBuild(): void {
    ComputerMapper.resetBuild(this.computerComponentNames);
    this.drawTable(null);
  }

  private getTotalPrice(): number {
    return this.dataSource?.data ?
      this.dataSource.data
        .map(data => data.price)
        .reduce((acc, value) => acc + value, 0)
      : 0;
  }

  private drawTable(computer: IComputerDto): void {
    this.components = ComputerMapper.toPartList(this.computerComponentNames, computer);
    this.dataSource = new MatTableDataSource(this.components);
    this.dataSource.sort = this.sort;
    this.totalPrice = this.getTotalPrice();
    this.checkAreAllPartsSelected(this.computerComponentNames);
  }

  private getCurrentUser(): IUserDto {
    return this.authService.getCurrentUser();
  }

  private checkAreAllPartsSelected(componentNames: ComputerComponentName[]): void {
    this.isSaveButtonDisabled =
      !componentNames
      .every(cn => sessionStorage.getItem(cn.shortName) !== null && sessionStorage.getItem(cn.shortName) !== undefined);
  }
}
