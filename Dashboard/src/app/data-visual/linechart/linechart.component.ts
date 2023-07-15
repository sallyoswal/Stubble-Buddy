import { Component, OnInit } from '@angular/core';
import { Chart } from 'chart.js';  
import { HttpClient } from '@angular/common/http';  
import { Data } from '../../../app/Data';

@Component({
  selector: 'app-linechart',
  templateUrl: './linechart.component.html',
  styleUrls: ['./linechart.component.scss']
})
export class LinechartComponent implements OnInit {

  
  url = 'https://7ocdzaurok.execute-api.us-east-1.amazonaws.com/default/FarmerReqLocations';  
  data: Data[];  
  Location = [];  
  Request = [];  
  Linechart = [];

  constructor(private httpClient: HttpClient) { }

  ngOnInit(): void {

    this.httpClient.get(this.url).subscribe((result: Data[]) => {  
      result.forEach(x => {  
        this.Location.push(x['Farmer Location']);  
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
