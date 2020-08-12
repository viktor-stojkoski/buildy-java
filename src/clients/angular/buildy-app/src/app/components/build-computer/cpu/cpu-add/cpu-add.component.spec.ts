import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CpuAddComponent } from './cpu-add.component';

describe('CpuAddComponent', () => {
  let component: CpuAddComponent;
  let fixture: ComponentFixture<CpuAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CpuAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CpuAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
