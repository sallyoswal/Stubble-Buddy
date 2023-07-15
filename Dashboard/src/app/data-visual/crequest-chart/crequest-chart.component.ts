import { Component, OnInit } from '@angular/core';
import { Chart } from 'chart.js';  
import { HttpClient } from '@angular/common/http';  
import { Data } from '../../../app/Data';

@Component({
  selector: 'app-crequest-chart',
  templateUrl: './crequest-chart.component.html',
  styleUrls: ['./crequest-chart.component.scss']
})
export class CRequestChartComponent implements OnInit {

  url = 'https://q6pgwp3vhc.execute-api.us-east-1.amazonaws.com/default/CompanyReqLocations';  
  data: Data[];  
  Location = [];  
  Request = [];  
  Linechart = [];

  constructor(private httpClient: HttpClient) { }

  ngOnInit(): void {

    this.httpClient.get(this.url).subscribe((result: Data[]) => {  
      result.forEach(x => {  
        this.Location.push(x['Company Location']);  
        this.Request.push(x['Request Id']);  
      });  
      this  
      this.Linechart = new Chart('canvas', {  
        type: 'bar',  
        data: {  
          labels: this.Location,  
          datasets: [  
            {  
              data: this.Request,  
              borderColor: '#3cb371',  
              backgroundColor: "#0000FF",  
            }  
          ]  
        },  
        options: {  
          legend: {  
            display: false  
          },  
          scales: {  
            xAxes: [{  
              display: true  
            }],  
            yAxes: [{  
              display: true  
            }],  
          }  
        }  
      });  
    });  
  }  


}
