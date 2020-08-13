import { IComputerComponentNameDto, IComputerDto, IPart, IComputerComponentDto } from 'src/app/models/computer.interfaces';
import { ComputerComponentName } from 'src/app/models/computer.models';

// tslint:disable-next-line: no-namespace
export namespace ComputerMapper {

  export function toPartList(componentNames: IComputerComponentNameDto[], computer: IComputerDto): IPart[] {
    if (computer === null || computer === undefined) {
      return getFromSessionOrSetEmpty(componentNames);
    }

    const cpu = fillPartFromComputerAndSetStorage(componentNames, computer.cpu);
    const gpu = fillPartFromComputerAndSetStorage(componentNames, computer.gpu);
    const ram = fillPartFromComputerAndSetStorage(componentNames, computer.ram);
    const pcCase = fillPartFromComputerAndSetStorage(componentNames, computer.pcCase);
    const motherboard = fillPartFromComputerAndSetStorage(componentNames, computer.motherboard);
    const storage = fillPartFromComputerAndSetStorage(componentNames, computer.storage);
    const cooling = fillPartFromComputerAndSetStorage(componentNames, computer.cooling);
    const psu = fillPartFromComputerAndSetStorage(componentNames, computer.psu);

    return Array.of(cpu, gpu, ram, pcCase, cooling, motherboard, psu, storage);
  }

  function getFromSessionOrSetEmpty(componentNames: IComputerComponentNameDto[]): IPart[] {
    // const cpu = JSON.parse(localStorage.getItem(ComputerComponentName.CPU.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.CPU.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.CPU.shortName));

    // const gpu = JSON.parse(localStorage.getItem(ComputerComponentName.GPU.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.GPU.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.GPU.shortName));

    // const ram = JSON.parse(localStorage.getItem(ComputerComponentName.RAM.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.RAM.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.RAM.shortName));

    // const pcCase = JSON.parse(localStorage.getItem(ComputerComponentName.Case.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.Case.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.Case.shortName));

    // const cooling = JSON.parse(localStorage.getItem(ComputerComponentName.Cooling.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.Cooling.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.Cooling.shortName));

    // const motherboard = JSON.parse(localStorage.getItem(ComputerComponentName.Motherboard.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.Motherboard.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.Motherboard.shortName));

    // const psu = JSON.parse(localStorage.getItem(ComputerComponentName.PSU.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.PSU.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.PSU.shortName));

    // const storage = JSON.parse(localStorage.getItem(ComputerComponentName.Storage.shortName)) ?
    //   JSON.parse(localStorage.getItem(ComputerComponentName.Storage.shortName)) :
    //   emptyPart(componentNames.find(c => c.shortName === ComputerComponentName.Storage.shortName));

    const cpu = fillPartFromStorage(componentNames, ComputerComponentName.CPU);
    const gpu = fillPartFromStorage(componentNames, ComputerComponentName.GPU);
    const ram = fillPartFromStorage(componentNames, ComputerComponentName.RAM);
    const storage = fillPartFromStorage(componentNames, ComputerComponentName.Storage);
    const motherboard = fillPartFromStorage(componentNames, ComputerComponentName.Motherboard);
    const pcCase = fillPartFromStorage(componentNames, ComputerComponentName.Case);
    const cooling = fillPartFromStorage(componentNames, ComputerComponentName.Cooling);
    const psu = fillPartFromStorage(componentNames, ComputerComponentName.PSU);

    return Array.of(cpu, gpu, ram, pcCase, cooling, motherboard, psu, storage);
  }

  function emptyPart(part: IComputerComponentNameDto): IPart {
    return {
      part: part.longName,
      selectedPart: '',
      price: 0
    };
  }

  function fillPartFromComputerAndSetStorage(componentNames: IComputerComponentNameDto[], part: IComputerComponentDto): IPart {
    const partName = componentNames.find(x => x.shortName === part.computerComponentName);
    const computerPart: IPart = {
      part: partName.longName,
      selectedPart: part.name,
      price: part.price
    };
    sessionStorage.setItem(partName.shortName, JSON.stringify(computerPart));

    return computerPart;
  }

  function fillPartFromStorage(componentNames: IComputerComponentNameDto[], part: ComputerComponentName): IPart {
    const itemFromStorage: IPart = JSON.parse(sessionStorage.getItem(part.shortName));
    return itemFromStorage ?
             itemFromStorage :
             emptyPart(componentNames.find(c => c.shortName === part.shortName));
  }
}
