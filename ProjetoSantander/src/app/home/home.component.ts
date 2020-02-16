import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  
  data:any = [1,1,1,1,1,1,1,1,1,1,1,1,1,1];

  constructor() { }

  ngOnInit(): void {
  }

}
