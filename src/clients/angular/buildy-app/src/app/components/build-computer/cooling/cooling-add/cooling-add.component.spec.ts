import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CoolingAddComponent } from './cooling-add.component';

describe('CoolingAddComponent', () => {
  let component: CoolingAddComponent;
  let fixture: ComponentFixture<CoolingAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CoolingAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CoolingAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
