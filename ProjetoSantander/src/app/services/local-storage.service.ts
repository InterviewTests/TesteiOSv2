import { Injectable } from '@angular/core';
import { Observable, Subject, BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LocalStorageService {


  constructor() { }

  saveData(key:string, value:any):any{

    localStorage.setItem(key, JSON.stringify(value));

    if (!localStorage.getItem(key)) {
      localStorage.set(key, new BehaviorSubject<any>(value));
    } else {
      localStorage.getItem(key);
    }
  }
  get(key: string): any {
    var item = localStorage.getItem(key);
    if (item === "undefined") {
        item = undefined;
    } else {
        item = JSON.parse(item);
    }
    return item;
  }
  clearAllData(){
    localStorage.clear();
  }
}
