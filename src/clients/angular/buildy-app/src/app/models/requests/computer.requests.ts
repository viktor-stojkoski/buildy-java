export class SaveComputerRequest {
  public userUid: string;
  public computerName: string;
  public cpu: ComputerComponentRequest;
  public gpu: ComputerComponentRequest;
  public ram: ComputerComponentRequest;
  public storage: ComputerComponentRequest;
  public pcCase: ComputerComponentRequest;
  public cooling: ComputerComponentRequest;
  public psu: ComputerComponentRequest;
  public motherboard: ComputerComponentRequest;
}

export class ComputerComponentRequest {
  public partUid: string;
}
