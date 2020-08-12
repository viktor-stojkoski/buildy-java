import { BaseDto } from './base.interfaces';

export interface ICpuDto extends BaseDto {
  id: number;
  uid: string;
  imageUrl: string;
  name: string;
  price: number;
  manufacturerName: string;
  socketName: string;
  cores: number;
  threads: number;
  frequency: number;
  cache: number;
  coolingSolution: boolean;
}
