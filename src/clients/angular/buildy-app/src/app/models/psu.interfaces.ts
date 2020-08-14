import { BaseComputerComponentDto } from './base.interfaces';

export interface IPsuDto extends BaseComputerComponentDto {
  manufacturerName: string;
  psuEfficiency: string;
  capacity: number;
  modularityType: string;
}
