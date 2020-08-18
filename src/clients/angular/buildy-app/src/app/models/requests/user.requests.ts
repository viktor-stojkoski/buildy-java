import { Gender } from '../enums/gender.enum';

export class LoginRequest {
  public username: string;
  public password: string;
}

export class RegisterRequest {
  public firstName: string;
  public lastName: string;
  public emailAddress: string;
  public username: string;
  public password: string;
  public gender: Gender;
  public dateOfBirth: Date;
}
