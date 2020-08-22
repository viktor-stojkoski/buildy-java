import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import * as moment from 'moment';
import { takeUntil } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { Gender } from 'src/app/models/enums/gender.enum';
import { RegisterRequest } from 'src/app/models/requests/user.requests';
import { AuthService } from 'src/app/services/auth/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent extends DestroyBaseComponent implements OnInit, OnDestroy {

  public genders = Object.keys(Gender);

  public formGroup: FormGroup;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router) {
    super();
  }

  public ngOnInit(): void {
    this.formGroup = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      username: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      gender: ['', Validators.required],
      dateOfBirth: ['', Validators.required]
    });

    console.log(this.formGroup.get('password'));
  }

  public register(): void {
    if (this.formGroup.valid) {
      const registerRequest: RegisterRequest = {
        firstName: this.formGroup.controls.firstName.value,
        lastName: this.formGroup.controls.lastName.value,
        emailAddress: this.formGroup.controls.email.value,
        username: this.formGroup.controls.username.value,
        password: this.formGroup.controls.password.value,
        gender: this.formGroup.controls.gender.value,
        dateOfBirth: moment.utc(this.formGroup.controls.dateOfBirth.value).toDate()
      };

      this.authService
        .register(registerRequest)
        .pipe(takeUntil(this.destroyed))
        .subscribe({
          next: () => {
            this.router.navigate(['login']);
          },
          error: error => console.error(error)
        });
    }
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }
}
