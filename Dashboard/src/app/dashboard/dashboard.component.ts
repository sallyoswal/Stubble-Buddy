import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  pNumber : Object;

  SelectEvent(id) {
    let obj = {'id': String(id)};
    this.pNumber = {...obj};
  }

  constructor() { }

  ngOnInit(): void {
  }

}
