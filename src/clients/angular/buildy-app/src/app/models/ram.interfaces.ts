import { BaseComputerComponentDto } from './base.interfaces';

export interface IRamDto extends BaseComputerComponentDto {
  manufacturerName: string;
  ramMemoryType: string;
  size: number;
  timing?: string;
  frequency: number;
}
