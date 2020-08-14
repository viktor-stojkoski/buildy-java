import { BaseComputerComponentDto } from './base.interfaces';

export interface ICaseDto extends BaseComputerComponentDto {
  manufacturerName: string;
  width: number;
  height: number;
  depth: number;
  numberOfFansSupported: number;
  motherboardType: string;
}
