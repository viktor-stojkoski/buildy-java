import { BaseComputerComponentDto } from './base.interfaces';

export interface IStorageDto extends BaseComputerComponentDto {
  manufacturerName: string;
  storageType: string;
  capacity: number;
  readingSpeed: number;
  writingSpeed: number;
}
