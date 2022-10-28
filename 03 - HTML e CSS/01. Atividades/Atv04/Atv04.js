let total = 0;

function teste(check, cod){
    if(check == true && cod == 1){
        total += 6;
    }else if(check == false && cod == 1){
        total -=6;
    }else if(check == true && cod == 2){
        total += 10;
    }else if(check == false && cod == 2){
        total -=10;
    }else if(check == true && cod == 3){
        total +=8;
    }else if(check == false && cod == 3){
        total -=8;
    }else if(check == true && cod == 4){
        total +=4.50;
    }else if(check == false && cod == 4){
        total -=4.50;
    }else if(check == true && cod == 5){
        total +=4.50;
    }else if(check == false && cod == 5){
        total -=4.50;
    }else if(check == true && cod == 6){
        total +=12;
    }else if(check == false && cod == 6){
        total -=12;
    }else if(check == true && cod == 7){
        total +=4;
    }else if(check == false && cod == 7){
        total -=4;
    }else if(check == true && cod == 8){
        total +=5.50;
    }else if(check == false && cod == 8){
        total -=5.50;
    }else if(check == true && cod == 9){
        total +=3.50;
    }else if(check == false && cod == 9){
        total -=3.50;
    }else if(check == true && cod == 10){
        total +=5;
    }else if(check == false && cod == 10){
        total -=5;
    }
    document.getElementById("total").innerHTML = total;
}