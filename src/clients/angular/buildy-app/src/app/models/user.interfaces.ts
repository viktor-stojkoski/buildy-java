import { BaseDto } from './base.interfaces';

export interface IUserDto extends BaseDto {
  emailAddress: string;
  username: string;
  roles: IRoleDto[];
}

export interface IRoleDto {
  name: string;
}
