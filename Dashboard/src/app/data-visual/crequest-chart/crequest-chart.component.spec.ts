import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CRequestChartComponent } from './crequest-chart.component';

describe('CRequestChartComponent', () => {
  let component: CRequestChartComponent;
  let fixture: ComponentFixture<CRequestChartComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CRequestChartComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CRequestChartComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
