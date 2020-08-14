import { BaseComputerComponentDto } from './base.interfaces';

export interface IMotherboardDto extends BaseComputerComponentDto {
  manufacturerName: string;
  motherboardType: string;
  socketName: string;
  memorySupported: number;
  numberOfDimmSlots: number;
}
