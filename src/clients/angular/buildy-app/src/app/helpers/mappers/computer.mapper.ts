import {IComputerComponentNameDto, IComputerDto, IPart} from 'src/app/models/computer.interfaces';

// tslint:disable-next-line: no-namespace
export namespace ComputerMapper {

  export function toPart(componentName: string, selectedPart: string, price: number): IPart {
    return {
      part: componentName,
      selectedPart,
      price
    };
  }

  export function toPartTest(componentNames: IComputerComponentNameDto[], computer: IComputerDto): IPart[] {
    if (computer === null) {
      const parts: IPart[] = componentNames.map(component => {
        return {
          part: component.longName,
          selectedPart: '',
          price: 0
        };
      });

      return parts;
    }

    const cpu: IPart = {
      part: componentNames.find(x => x.shortName === computer.cpu.computerComponentName).longName,
      selectedPart: computer.cpu.name,
      price: computer.cpu.price
    };

    const gpu: IPart = {
      part: componentNames.find(x => x.shortName === computer.gpu.computerComponentName).longName,
      selectedPart: computer.gpu.name,
      price: computer.gpu.price
    };

    const ram: IPart = {
      part: componentNames.find(x => x.shortName === computer.ram.computerComponentName).longName,
      selectedPart: computer.ram.name,
      price: computer.ram.price
    };

    const pcCase: IPart = {
      part: componentNames.find(x => x.shortName === computer.pcCase.computerComponentName).longName,
      selectedPart: computer.pcCase.name,
      price: computer.pcCase.price
    };

    const cooling: IPart = {
      part: componentNames.find(x => x.shortName === computer.cooling.computerComponentName).longName,
      selectedPart: computer.cooling.name,
      price: computer.cooling.price
    };

    const motherboard: IPart = {
      part: componentNames.find(x => x.shortName === computer.motherboard.computerComponentName).longName,
      selectedPart: computer.motherboard.name,
      price: computer.motherboard.price
    };

    const psu: IPart = {
      part: componentNames.find(x => x.shortName === computer.psu.computerComponentName).longName,
      selectedPart: computer.psu.name,
      price: computer.psu.price
    };

    const storage: IPart = {
      part: componentNames.find(x => x.shortName === computer.storage.computerComponentName).longName,
      selectedPart: computer.storage.name,
      price: computer.storage.price
    };

    return Array.of(cpu, gpu, ram, pcCase, cooling, motherboard, psu, storage);
  }
}
