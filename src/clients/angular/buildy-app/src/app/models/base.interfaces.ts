export interface BaseDto {
  id: number;
  uid: string;
}

export interface BaseComputerComponentDto extends BaseDto {
  imageUrl: string;
  name: string;
  price: number;
}
