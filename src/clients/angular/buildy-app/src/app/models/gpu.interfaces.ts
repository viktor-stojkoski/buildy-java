import { BaseComputerComponentDto } from './base.interfaces';

export interface IGpuDto extends BaseComputerComponentDto {
  manufacturerName: string;
  gpuMemoryType: string;
  ramSize: number;
  timing: string;
  frequency: number;
  memoryClock: number;
}
