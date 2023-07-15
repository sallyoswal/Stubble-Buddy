import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GridOptions } from 'ag-grid-community';

@Component({
  selector: 'app-company-list',
  templateUrl: './company-list.component.html',
  styleUrls: ['./company-list.component.scss']
})
export class CompanyListComponent implements OnInit {

  domLayout = "autoHeight";
  gridOptions: any;

  columnDefs = [];
  rowData : any;  

  constructor(private http: HttpClient) { }

  ngOnInit() {

    this.columnDefs = [
      {field: 'Company Id' , width : 180, sortable: true, filter: true, resizable: true},
      {field: 'Company Name', width : 180, sortable: true, filter: true, resizable: true},
      {field: 'Company Location', width : 180, sortable: true, filter: true, resizable: true},
      {field: 'Email Id', width : 180, sortable: true, filter: true, resizable: true},
      {field: 'Phone No', width : 180, sortable: true, filter: true, resizable: true},
      {field: 'Registration Number', width : 180, sortable: true, filter: true, resizable: true},
    ];
    this.gridOptions = <GridOptions>{};
    this.http.get('https://jqzp5nxmcf.execute-api.us-east-1.amazonaws.com/Default/resource')
    .subscribe((data: any) => {
      this.rowData = data;
      this.gridOptions.api.setColumnDefs(this.columnDefs);
      this.gridOptions.api.setRowData(this.rowData);
    });

  }


}
