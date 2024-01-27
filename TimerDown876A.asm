
_checkButtons:

;TimerDown876A.c,15 :: 		void checkButtons()
;TimerDown876A.c,18 :: 		if(Button(&PORTB, 4, 100, 1)) {  // Increase sekundi1
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      4
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_checkButtons0
;TimerDown876A.c,19 :: 		sekundi1 = sekundi1 + 5;
	MOVLW      5
	ADDWF      _sekundi1+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      _sekundi1+0
;TimerDown876A.c,20 :: 		if(sekundi1 < 0 || sekundi1 > 59){ sekundi1 = 0; }
	MOVLW      0
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__checkButtons34
	MOVF       _sekundi1+0, 0
	SUBLW      59
	BTFSS      STATUS+0, 0
	GOTO       L__checkButtons34
	GOTO       L_checkButtons3
L__checkButtons34:
	CLRF       _sekundi1+0
L_checkButtons3:
;TimerDown876A.c,22 :: 		sekundi = sekundi1;    //auxiliary variable for seconds
	MOVF       _sekundi1+0, 0
	MOVWF      _sekundi+0
;TimerDown876A.c,23 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;TimerDown876A.c,24 :: 		zname1= 0;
	BCF        _zname1+0, BitPos(_zname1+0)
;TimerDown876A.c,26 :: 		}
L_checkButtons0:
;TimerDown876A.c,27 :: 		if(Button(&PORTB, 5, 100, 1)){   //adding to minuti1
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      5
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_checkButtons4
;TimerDown876A.c,28 :: 		minuti1 = minuti1 + 5;
	MOVLW      5
	ADDWF      _minuti1+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      _minuti1+0
;TimerDown876A.c,29 :: 		if(minuti1 < 0 || minuti1 > 59){ minuti1 = 0; }  //minuti1 is setted to 0
	MOVLW      0
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__checkButtons33
	MOVF       _minuti1+0, 0
	SUBLW      59
	BTFSS      STATUS+0, 0
	GOTO       L__checkButtons33
	GOTO       L_checkButtons7
L__checkButtons33:
	CLRF       _minuti1+0
L_checkButtons7:
;TimerDown876A.c,30 :: 		minuti = minuti1;  //auxiliary variable for minutes
	MOVF       _minuti1+0, 0
	MOVWF      _minuti+0
;TimerDown876A.c,31 :: 		oldstate = 0;      //oldstate reset , not counting
	BCF        _oldstate+0, BitPos(_oldstate+0)
;TimerDown876A.c,32 :: 		zname1 = 0;        //Add +5 to minuti1 variable
	BCF        _zname1+0, BitPos(_zname1+0)
;TimerDown876A.c,33 :: 		}
L_checkButtons4:
;TimerDown876A.c,34 :: 		if(Button(&PORTB, 6, 100, 1)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      6
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_checkButtons8
;TimerDown876A.c,36 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;TimerDown876A.c,37 :: 		zname1 = 0;
	BCF        _zname1+0, BitPos(_zname1+0)
;TimerDown876A.c,38 :: 		sekundi1 = 0;
	CLRF       _sekundi1+0
;TimerDown876A.c,39 :: 		minuti1 = 0;
	CLRF       _minuti1+0
;TimerDown876A.c,40 :: 		}
L_checkButtons8:
;TimerDown876A.c,41 :: 		if(Button(&PORTB, 7, 100, 1)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      7
	MOVWF      FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_checkButtons9
;TimerDown876A.c,43 :: 		zname1 = 0;
	BCF        _zname1+0, BitPos(_zname1+0)
;TimerDown876A.c,45 :: 		oldstate = 1;
	BSF        _oldstate+0, BitPos(_oldstate+0)
;TimerDown876A.c,46 :: 		}
L_checkButtons9:
;TimerDown876A.c,47 :: 		if(Button(&PORTC, 0, 100, 1)  && (zname1 == 1)){
	MOVLW      PORTC+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_checkButtons12
	BTFSS      _zname1+0, BitPos(_zname1+0)
	GOTO       L_checkButtons12
L__checkButtons32:
;TimerDown876A.c,50 :: 		PORTC.RB1 = 0;   //PortC pin 1 is High
	BCF        PORTC+0, 1
;TimerDown876A.c,51 :: 		zname1 = 0;
	BCF        _zname1+0, BitPos(_zname1+0)
;TimerDown876A.c,52 :: 		sekundi1 = 0;
	CLRF       _sekundi1+0
;TimerDown876A.c,53 :: 		minuti1 = 0;
	CLRF       _minuti1+0
;TimerDown876A.c,54 :: 		sekundi = 0;
	CLRF       _sekundi+0
;TimerDown876A.c,55 :: 		minuti = 0;
	CLRF       _minuti+0
;TimerDown876A.c,56 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;TimerDown876A.c,57 :: 		}
L_checkButtons12:
;TimerDown876A.c,58 :: 		}
L_end_checkButtons:
	RETURN
; end of _checkButtons

_InitTimer0:

;TimerDown876A.c,60 :: 		void InitTimer0(){
;TimerDown876A.c,61 :: 		OPTION_REG         = 0x83;  //  for 2ms
	MOVLW      131
	MOVWF      OPTION_REG+0
;TimerDown876A.c,62 :: 		TMR0                 = 6;   // for 2ms
	MOVLW      6
	MOVWF      TMR0+0
;TimerDown876A.c,63 :: 		INTCON         = 0xA0;      //for 2ms
	MOVLW      160
	MOVWF      INTCON+0
;TimerDown876A.c,64 :: 		}
L_end_InitTimer0:
	RETURN
; end of _InitTimer0

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;TimerDown876A.c,65 :: 		void Interrupt(){
;TimerDown876A.c,66 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt13
;TimerDown876A.c,67 :: 		TMR0IF_bit         = 0;  // TMROIF_BIT for 2ms
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;TimerDown876A.c,68 :: 		TMR0                 = 6;  //TMR0 for 2ms
	MOVLW      6
	MOVWF      TMR0+0
;TimerDown876A.c,70 :: 		if(digit_no == 0)
	MOVLW      0
	XORWF      _digit_no+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt40
	MOVLW      0
	XORWF      _digit_no+0, 0
L__Interrupt40:
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt14
;TimerDown876A.c,72 :: 		PORTA = 0x00;    //PORTA is all zeros
	CLRF       PORTA+0
;TimerDown876A.c,73 :: 		digit_no++;      //increment digit_no by one
	INCF       _digit_no+0, 1
	BTFSC      STATUS+0, 2
	INCF       _digit_no+1, 1
;TimerDown876A.c,74 :: 		PORTB = sekundi_edinici;   //sekundi_edinici is given to PORTB
	MOVF       _sekundi_edinici+0, 0
	MOVWF      PORTB+0
;TimerDown876A.c,75 :: 		PORTA = 1; //0001  LSB is set to 1, all others zeros
	MOVLW      1
	MOVWF      PORTA+0
;TimerDown876A.c,77 :: 		}
	GOTO       L_Interrupt15
L_Interrupt14:
;TimerDown876A.c,78 :: 		else if(digit_no == 1)
	MOVLW      0
	XORWF      _digit_no+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt41
	MOVLW      1
	XORWF      _digit_no+0, 0
L__Interrupt41:
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt16
;TimerDown876A.c,80 :: 		PORTA = 0x00;      //PORTA is all zeros
	CLRF       PORTA+0
;TimerDown876A.c,81 :: 		digit_no++;        //increment digit_no by one
	INCF       _digit_no+0, 1
	BTFSC      STATUS+0, 2
	INCF       _digit_no+1, 1
;TimerDown876A.c,82 :: 		PORTB = sekundi_desetki; //sekundi_desetki is given to PORTB
	MOVF       _sekundi_desetki+0, 0
	MOVWF      PORTB+0
;TimerDown876A.c,83 :: 		PORTA = 2; //0010 combination to turn on the second display
	MOVLW      2
	MOVWF      PORTA+0
;TimerDown876A.c,85 :: 		}
	GOTO       L_Interrupt17
L_Interrupt16:
;TimerDown876A.c,86 :: 		else if(digit_no == 2)
	MOVLW      0
	XORWF      _digit_no+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt42
	MOVLW      2
	XORWF      _digit_no+0, 0
L__Interrupt42:
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt18
;TimerDown876A.c,88 :: 		PORTA = 0x00;    //PORTA is all zeros
	CLRF       PORTA+0
;TimerDown876A.c,89 :: 		digit_no++;      //increment digit_no by one
	INCF       _digit_no+0, 1
	BTFSC      STATUS+0, 2
	INCF       _digit_no+1, 1
;TimerDown876A.c,90 :: 		PORTB = minuti_edinici; //minuti_edinici is given to PORTB
	MOVF       _minuti_edinici+0, 0
	MOVWF      PORTB+0
;TimerDown876A.c,91 :: 		PORTA = 4; //0100 combination to turn on the third display
	MOVLW      4
	MOVWF      PORTA+0
;TimerDown876A.c,93 :: 		}
	GOTO       L_Interrupt19
L_Interrupt18:
;TimerDown876A.c,96 :: 		PORTA = 0x00;   //PORTA is all zeros
	CLRF       PORTA+0
;TimerDown876A.c,97 :: 		digit_no = 0;   //digit_no is now zero
	CLRF       _digit_no+0
	CLRF       _digit_no+1
;TimerDown876A.c,98 :: 		PORTB = minuti_desetki;  //minuti_desetki is given to PORTB
	MOVF       _minuti_desetki+0, 0
	MOVWF      PORTB+0
;TimerDown876A.c,99 :: 		PORTA = 8; //1000 combination to turn on the fourth display
	MOVLW      8
	MOVWF      PORTA+0
;TimerDown876A.c,101 :: 		}
L_Interrupt19:
L_Interrupt17:
L_Interrupt15:
;TimerDown876A.c,104 :: 		if(oldstate == 1){
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_Interrupt20
;TimerDown876A.c,106 :: 		broi_1ms++;
	INCF       _broi_1ms+0, 1
	BTFSC      STATUS+0, 2
	INCF       _broi_1ms+1, 1
;TimerDown876A.c,107 :: 		if(broi_1ms > 500) // 500*2ms equal 1s
	MOVF       _broi_1ms+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt43
	MOVF       _broi_1ms+0, 0
	SUBLW      244
L__Interrupt43:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt21
;TimerDown876A.c,109 :: 		broi_1ms = 0; // counter for millis is reseted to  zero to count again
	CLRF       _broi_1ms+0
	CLRF       _broi_1ms+1
;TimerDown876A.c,110 :: 		sekundi1--;    //sekundi is reduced by one value
	DECF       _sekundi1+0, 1
;TimerDown876A.c,111 :: 		}
L_Interrupt21:
;TimerDown876A.c,112 :: 		if(sekundi1 < 1)   //sekundi is less than 1
	MOVLW      1
	SUBWF      _sekundi1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt22
;TimerDown876A.c,114 :: 		sekundi1 = 59;  // sekundi is now 59
	MOVLW      59
	MOVWF      _sekundi1+0
;TimerDown876A.c,115 :: 		minuti1--;      // minuti is reduced by one value
	DECF       _minuti1+0, 1
;TimerDown876A.c,116 :: 		}
L_Interrupt22:
;TimerDown876A.c,117 :: 		if(minuti < 1) //if minuti is less than 1
	MOVLW      1
	SUBWF      _minuti+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt23
;TimerDown876A.c,119 :: 		minuti1 = 0;    //minuti is set to zero
	CLRF       _minuti1+0
;TimerDown876A.c,120 :: 		}
L_Interrupt23:
;TimerDown876A.c,121 :: 		}
L_Interrupt20:
;TimerDown876A.c,124 :: 		}
L_Interrupt13:
;TimerDown876A.c,125 :: 		}
L_end_Interrupt:
L__Interrupt39:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;TimerDown876A.c,127 :: 		void main() {
;TimerDown876A.c,129 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;TimerDown876A.c,130 :: 		TRISB = 0b11110000; //B0 through  B3 are outputs B4 through B7 are inputs
	MOVLW      240
	MOVWF      TRISB+0
;TimerDown876A.c,131 :: 		TRISC = 0b00000001; // all are outputs except C0 is input
	MOVLW      1
	MOVWF      TRISC+0
;TimerDown876A.c,133 :: 		PORTA = 0;    //all zeros
	CLRF       PORTA+0
;TimerDown876A.c,134 :: 		PORTB = 0;    //all zeros
	CLRF       PORTB+0
;TimerDown876A.c,135 :: 		PORTC = 0;    //all zeros
	CLRF       PORTC+0
;TimerDown876A.c,136 :: 		sekundi_edinici = 0; sekundi_desetki = 0; minuti_edinici = 0; minuti_desetki = 0;  //all zeros
	CLRF       _sekundi_edinici+0
	CLRF       _sekundi_desetki+0
	CLRF       _minuti_edinici+0
	CLRF       _minuti_desetki+0
;TimerDown876A.c,137 :: 		sekundi = 0; minuti = 0; sekundi_vkupno = 0; //all zeros
	CLRF       _sekundi+0
	CLRF       _minuti+0
	CLRF       _sekundi_vkupno+0
;TimerDown876A.c,138 :: 		oldstate = 0; zname1 = 0;    //all zeros
	BCF        _oldstate+0, BitPos(_oldstate+0)
	BCF        _zname1+0, BitPos(_zname1+0)
;TimerDown876A.c,140 :: 		InitTimer0();   //Initialization of timer
	CALL       _InitTimer0+0
;TimerDown876A.c,146 :: 		do{
L_main24:
;TimerDown876A.c,147 :: 		checkButtons(); //check the buttons function
	CALL       _checkButtons+0
;TimerDown876A.c,148 :: 		if(oldstate == 1)
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_main27
;TimerDown876A.c,150 :: 		sekundi_edinici = Dec2Bcd(sekundi1 % 10u);  // odeluvanje na sekundi edinici
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sekundi1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _sekundi_edinici+0
;TimerDown876A.c,151 :: 		sekundi_desetki = Dec2Bcd((sekundi1 / 10u) % 10u);  //oddeluvanje na sekundi desetki
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sekundi1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _sekundi_desetki+0
;TimerDown876A.c,152 :: 		minuti_edinici =Dec2Bcd(minuti1 % 10u);    //oddeluvanje na minuti edinici
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minuti1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _minuti_edinici+0
;TimerDown876A.c,153 :: 		minuti_desetki =Dec2Bcd((minuti1 / 10u ) % 10u);    //oddeluvanje na minuti desetki
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minuti1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _minuti_desetki+0
;TimerDown876A.c,154 :: 		}
	GOTO       L_main28
L_main27:
;TimerDown876A.c,157 :: 		sekundi_edinici = Dec2Bcd(sekundi % 10u);  // odeluvanje na sekundi edinici
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sekundi+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _sekundi_edinici+0
;TimerDown876A.c,158 :: 		sekundi_desetki = Dec2Bcd((sekundi / 10u) % 10u);  //oddeluvanje na sekundi desetki
	MOVLW      10
	MOVWF      R4+0
	MOVF       _sekundi+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _sekundi_desetki+0
;TimerDown876A.c,159 :: 		minuti_edinici =Dec2Bcd( minuti % 10u);    //oddeluvanje na minuti edinici
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minuti+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _minuti_edinici+0
;TimerDown876A.c,160 :: 		minuti_desetki =Dec2Bcd((minuti / 10u ) % 10u);    //oddeluvanje na minuti desetki
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minuti+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      _minuti_desetki+0
;TimerDown876A.c,161 :: 		}
L_main28:
;TimerDown876A.c,162 :: 		if((oldstate>=1) && (minuti1 == 0) && (sekundi1 <= 1))
	CLRF       R1+0
	BTFSC      _oldstate+0, BitPos(_oldstate+0)
	INCF       R1+0, 1
	MOVLW      1
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main31
	MOVF       _minuti1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main31
	MOVF       _sekundi1+0, 0
	SUBLW      1
	BTFSS      STATUS+0, 0
	GOTO       L_main31
L__main35:
;TimerDown876A.c,166 :: 		oldstate = 0;    //not counting milliseconds
	BCF        _oldstate+0, BitPos(_oldstate+0)
;TimerDown876A.c,167 :: 		PORTC.RB1 = 1;   //PortC pin 1 is High
	BSF        PORTC+0, 1
;TimerDown876A.c,168 :: 		sekundi1 = 0;    //reseted
	CLRF       _sekundi1+0
;TimerDown876A.c,169 :: 		minuti1 = 0;    //reseted
	CLRF       _minuti1+0
;TimerDown876A.c,170 :: 		sekundi = 0;
	CLRF       _sekundi+0
;TimerDown876A.c,171 :: 		minuti = 0;
	CLRF       _minuti+0
;TimerDown876A.c,172 :: 		zname1 = 1;     //flag for
	BSF        _zname1+0, BitPos(_zname1+0)
;TimerDown876A.c,173 :: 		}
L_main31:
;TimerDown876A.c,177 :: 		while(1); //using do while for looping the same thing over again
	GOTO       L_main24
;TimerDown876A.c,180 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
