import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RamAddComponent } from './ram-add.component';

describe('RamAddComponent', () => {
  let component: RamAddComponent;
  let fixture: ComponentFixture<RamAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RamAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RamAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
