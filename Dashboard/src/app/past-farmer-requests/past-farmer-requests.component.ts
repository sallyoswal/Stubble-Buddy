import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GridOptions } from 'ag-grid-community';

@Component({
  selector: 'app-past-farmer-requests',
  templateUrl: './past-farmer-requests.component.html',
  styleUrls: ['./past-farmer-requests.component.scss']
})
export class PastFarmerRequestsComponent implements OnInit {

  domLayout = "autoHeight";
  gridOptions: any;

  columnDefs = [];
  rowData : any;  

  constructor(private http: HttpClient) { }

  ngOnInit() {

    this.columnDefs = [
      {field: 'Farmer Req Id' , width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Company Req Id', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Farmer Id', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Company Id', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Order Date', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Stubble Amount Sold', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Order Completion Date', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Farmer Request Status', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Money Received', width : 154, sortable: true, filter: true, resizable: true},
    ];
    this.gridOptions = <GridOptions>{};
    this.http.get('https://2epyfpdqif.execute-api.us-east-1.amazonaws.com/default/ReadPastFarmerRequests')
    .subscribe((data: any) => {
      this.rowData = data;
      this.gridOptions.api.setColumnDefs(this.columnDefs);
      this.gridOptions.api.setRowData(this.rowData);
    });

  }

}
