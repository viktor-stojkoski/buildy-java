import { Component, OnInit, OnDestroy } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth/auth.service';
import { UserRequest } from 'src/app/models/requests/user.requests';
import { DestroyBaseComponent } from 'src/app/helpers/components/destroy-base.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent extends DestroyBaseComponent implements OnInit, OnDestroy {

  public formGroup: FormGroup;

  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
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

      const userRequest: UserRequest = {
        username,
        password
      };

      this.authService
        .login(userRequest)
        .subscribe({
          next: result => {
            console.log(result);
          },
          error: error => console.error(error)
      });
    }
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }
}