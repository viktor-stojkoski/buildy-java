import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-save-build-dialog',
  templateUrl: './save-build-dialog.component.html',
  styleUrls: ['./save-build-dialog.component.scss']
})
export class SaveBuildDialogComponent {

  constructor(
    public dialogRef: MatDialogRef<SaveBuildDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data
  ) { }

  public onCancelClick(): void {
    this.dialogRef.close();
  }
}
