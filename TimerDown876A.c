unsigned int   digit, number;

unsigned int digit_no;
unsigned int bcd_code = 0;
int i;

bit oldstate, zname1;                                    // Old state (flag)
unsigned int broi_1ms, flag_1s;                      //flag for seconds, counter for milliseconds
unsigned short  sekundi, minuti, sekundi1, minuti1; // variables for seconds, minutes and auxiliaries for them
unsigned short sekundi_desetki, sekundi_edinici, minuti_edinici, minuti_desetki;     //auxiliary variables
unsigned short sekundi_vkupno;     //new variable for seconds and minutes

//BCD digits on PORTB(0 to 3)
//Buttons
void checkButtons()
{
                   
                if(Button(&PORTB, 4, 100, 1)) {  // Increase sekundi1
                   sekundi1 = sekundi1 + 5;
                   if(sekundi1 < 0 || sekundi1 > 59){ sekundi1 = 0; }
                   //sekundi1 is now zero
                   sekundi = sekundi1;    //auxiliary variable for seconds
                   oldstate = 0;
                   zname1= 0;
                                                     //Add +5 to sekundi1
                }
                if(Button(&PORTB, 5, 100, 1)){   //adding to minuti1
                    minuti1 = minuti1 + 5;
                    if(minuti1 < 0 || minuti1 > 59){ minuti1 = 0; }  //minuti1 is setted to 0
                    minuti = minuti1;  //auxiliary variable for minutes
                    oldstate = 0;      //oldstate reset , not counting
                    zname1 = 0;        //Add +5 to minuti1 variable
                 }
                 if(Button(&PORTB, 6, 100, 1)){                  
                    //RESET  EVERYTHING
                    oldstate = 0;
                    zname1 = 0;
                    sekundi1 = 0;
                    minuti1 = 0;
                 }
                 if(Button(&PORTB, 7, 100, 1)){
                    //START TO COUNT BACKWARDS
                    zname1 = 0;
                    //sekundi_vkupno = (minuti1*60) + sekundi1;
                    oldstate = 1;
                 }
                 if(Button(&PORTC, 0, 100, 1)  && (zname1 == 1)){
                 //if oldstate is logical "1" and the button is pressed, and zname1 is logical "1"
                 //then everything is reseted and not counting time
                    PORTC.RB1 = 0;   //PortC pin 1 is LOW
                    zname1 = 0;
                    sekundi1 = 0;
                    minuti1 = 0;
                    sekundi = 0;
                    minuti = 0;
                    oldstate = 0;
                 }
}

void InitTimer0(){
    OPTION_REG         = 0x83;  //  for 2ms
    TMR0                 = 6;   // for 2ms
    INTCON         = 0xA0;      //for 2ms
}
void Interrupt(){
     if (TMR0IF_bit){
                TMR0IF_bit         = 0;  // TMROIF_BIT for 2ms
                TMR0                 = 6;  //TMR0 for 2ms
                
                if(digit_no == 0)
                {
                   PORTA = 0x00;    //PORTA is all zeros
                   digit_no++;      //increment digit_no by one
                   PORTB = sekundi_edinici;   //sekundi_edinici is given to PORTB
                   PORTA = 1; //0001  LSB is set to 1, all others zeros

                }
                else if(digit_no == 1)
                {
                   PORTA = 0x00;      //PORTA is all zeros
                   digit_no++;        //increment digit_no by one
                   PORTB = sekundi_desetki; //sekundi_desetki is given to PORTB
                   PORTA = 2; //0010 combination to turn on the second display

                }
                else if(digit_no == 2)
                {
                   PORTA = 0x00;    //PORTA is all zeros
                   digit_no++;      //increment digit_no by one
                   PORTB = minuti_edinici; //minuti_edinici is given to PORTB
                   PORTA = 4; //0100 combination to turn on the third display

                }
                else  //digit_no is equal to 3
                {
                    PORTA = 0x00;   //PORTA is all zeros
                    digit_no = 0;   //digit_no is now zero
                    PORTB = minuti_desetki;  //minuti_desetki is given to PORTB
                    PORTA = 8; //1000 combination to turn on the fourth display

                }

        //if( oldstate == 1)
        if(oldstate == 1){
        //start to count 2 milliseconds
           broi_1ms++;
                if(broi_1ms > 500) // 500*2ms equal 1s  isto i ova broi_1ms % 500 == 0
                {
                   broi_1ms = 0; // counter for millis is reseted to  zero to count again
                   sekundi1--;    //sekundi is reduced by one value
                }
                if(sekundi1 < 1)   //sekundi is less than 1
                {
                     //probaj sekundi seconds == 0
                     sekundi1 = 59;  // sekundi is now 59
                     minuti1--;      // minuti is reduced by one value
                }
                if(minuti < 1) //if minuti is less than 1
                {
                     minuti1 = 0;    //minuti is set to zero
                }
        }


    }
}

void main() {

       TRISA = 0x00;
       TRISB = 0b11110000; //B0 through  B3 are outputs B4 through B7 are inputs
       TRISC = 0b00000001; // all are outputs except C0 is input

       PORTA = 0;    //all zeros
       PORTB = 0;    //all zeros
       PORTC = 0;    //all zeros
       sekundi_edinici = 0; sekundi_desetki = 0; minuti_edinici = 0; minuti_desetki = 0;  //all zeros
       sekundi = 0; minuti = 0; sekundi_vkupno = 0; //all zeros
       oldstate = 0; zname1 = 0;    //all zeros
       
       InitTimer0();   //Initialization of timer





       do{
                checkButtons(); //check the buttons function
                if(oldstate == 1)
                {
                    sekundi_edinici = Dec2Bcd(sekundi1 % 10u);  // odeluvanje na sekundi edinici
                    sekundi_desetki = Dec2Bcd((sekundi1 / 10u) % 10u);  //oddeluvanje na sekundi desetki
                    minuti_edinici =Dec2Bcd(minuti1 % 10u);    //oddeluvanje na minuti edinici
                    minuti_desetki =Dec2Bcd((minuti1 / 10u ) % 10u);    //oddeluvanje na minuti desetki
                }
                else
                {
                    sekundi_edinici = Dec2Bcd(sekundi % 10u);  // odeluvanje na sekundi edinici
                    sekundi_desetki = Dec2Bcd((sekundi / 10u) % 10u);  //oddeluvanje na sekundi desetki
                    minuti_edinici =Dec2Bcd( minuti % 10u);    //oddeluvanje na minuti edinici
                    minuti_desetki =Dec2Bcd((minuti / 10u ) % 10u);    //oddeluvanje na minuti desetki
                }
                if((oldstate>=1) && (minuti1 == 0) && (sekundi1 <= 1))
                {
                  //if we are at the position 00:00(mm:ss) now C1 is set to one and all variables for seconds and minutes are reseted
                  // bide pushtena se dodeka ne ja isklucime od taster
                  oldstate = 0;    //not counting milliseconds
                  PORTC.RB1 = 1;   //PortC pin 1 is High
                  sekundi1 = 0;    //reseted
                  minuti1 = 0;    //reseted
                  sekundi = 0;
                  minuti = 0;
                  zname1 = 1;     //flag for
                }


       }
       while(1); //using do while for looping the same thing over again


}