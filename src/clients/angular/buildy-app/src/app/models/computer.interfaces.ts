export interface IPart {
  part: string;
  selectedPart: string;
  price: number;
}

export interface IComputerComponentNameDto {
  shortName: string;
  longName: string;
}

export interface IComputerComponentDto {
  name: string;
  price: number;
  computerComponentName: string;
}

export interface IComputerDto {
  cpu: IComputerComponentDto;
  gpu: IComputerComponentDto;
  ram: IComputerComponentDto;
  pcCase: IComputerComponentDto;
  cooling: IComputerComponentDto;
  motherboard: IComputerComponentDto;
  psu: IComputerComponentDto;
  storage: IComputerComponentDto;
}
