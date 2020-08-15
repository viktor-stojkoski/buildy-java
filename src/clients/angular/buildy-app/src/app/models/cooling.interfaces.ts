import { BaseComputerComponentDto } from './base.interfaces';

export interface ICoolingDto extends BaseComputerComponentDto {
  manufacturerName: string;
  size: number;
  speed: number;
  coolingType: string;
  isRgb: boolean;
}
