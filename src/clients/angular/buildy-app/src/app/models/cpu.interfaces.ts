import { BaseComputerComponentDto } from './base.interfaces';

export interface ICpuDto extends BaseComputerComponentDto {
  manufacturerName: string;
  socketName: string;
  cores: number;
  threads: number;
  frequency: number;
  cache: number;
  coolingSolution: boolean;
}
