import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { takeUntil } from 'rxjs/operators';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';
import { LoginRequest } from 'src/app/models/requests/user.requests';
import { AuthService } from 'src/app/services/auth/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent extends DestroyBaseComponent implements OnInit, OnDestroy {

  public formGroup: FormGroup;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private authService: AuthService
  ) {
    super();
  }

  public ngOnInit(): void {
    this.formGroup = this.fb.group({
      email: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  public onSubmit(): void {
    if (this.formGroup.valid) {
      const username = this.formGroup.controls.email.value;
      const password = this.formGroup.controls.password.value;

      const loginRequest: LoginRequest = {
        username,
        password
      };

      this.authService
        .login(loginRequest)
        .pipe(takeUntil(this.destroyed))
        .subscribe({
          next: () => {
            this.router.navigate(['']);
          },
          error: error => console.error(error)
      });
    }
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }
}
