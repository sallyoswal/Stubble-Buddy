import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GridOptions } from 'ag-grid-community';

@Component({
  selector: 'app-past-company-requests',
  templateUrl: './past-company-requests.component.html',
  styleUrls: ['./past-company-requests.component.scss']
})
export class PastCompanyRequestsComponent implements OnInit {

  domLayout = "autoHeight";
  gridOptions: any;

  columnDefs = [];
  rowData : any;  

  constructor(private http: HttpClient) { }

  ngOnInit() {

    this.columnDefs = [
      {field: 'Request Id' , width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Company Id', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Company Name', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Order Date', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Order Completion Date', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Stubble Amount', width : 154, sortable: true, filter: true, resizable: true},
      {field: 'Cost', width : 154, sortable: true, filter: true, resizable: true},
    ];
    this.gridOptions = <GridOptions>{};
    this.http.get('https://wbqvw9dgh6.execute-api.us-east-1.amazonaws.com/default/ReadPastCompanyReq')
    .subscribe((data: any) => {
      this.rowData = data;
      this.gridOptions.api.setColumnDefs(this.columnDefs);
      this.gridOptions.api.setRowData(this.rowData);
    });

  }

}
