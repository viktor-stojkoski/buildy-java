export class ComputerComponentName {
  public static readonly CPU = new ComputerComponentName('CPU', 'Processor');
  public static readonly GPU = new ComputerComponentName('GPU', 'Graphics card');
  public static readonly RAM = new ComputerComponentName('RAM', 'RAM');
  public static readonly Case = new ComputerComponentName('Case', 'Case');
  public static readonly Cooling = new ComputerComponentName('Cooling', 'Cooling Fan');
  public static readonly PSU = new ComputerComponentName('PSU', 'Power supply');
  public static readonly Motherboard = new ComputerComponentName('Motherboard', 'Motherboard');
  public static readonly Storage = new ComputerComponentName('Storage', 'Storage');

  private constructor(public readonly shortName: string,
                      public readonly longName: string) { }
}
