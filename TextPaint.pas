program smile;

uses
  CRT;

const
  xx = 30;
  yy = 20;

var
  matrix: array[1..xx, 1..yy] of string;
  x, y,i,j: integer;
  key,kist,fon: char;
  ye:boolean;
  save:text;

begin
x:=5;
y:=6;
ye:=false;
For i:=1 to yy do //инициализация
 Begin 
  For j:=1 to xx do 
   matrix[j,i]:=' ';
   Writeln();
 End;
 Gotoxy(1,1);
 Writeln('Для управления используйте стрелки.');
 Writeln('Нажмите E для выбора символа.');
 Writeln('Нажмите F для изменения режима. (Рисует\ Не рисует)'); 
 Writeln('Для продолжения нажмите любую клавишу...');  
 Readkey;
 Clrscr;
 repeat
  //Clrscr;
  gotoxy(1,1);

  for i:=1 to yy do 
  Begin
   For j:=1 to xx do
    Write(matrix[j,i]);
   Writeln();
  End; 
  Gotoxy(x, y);
    key := readkey;
    if key = #0 then key := readkey;
    case ord(key) of
      38: Begin dec(y); If y<1 then inc(y); End;
      40: Begin inc(y); If y=yy then dec(y); End;
      39: Begin inc(x); If x=xx then dec(x); End;
      37: Begin dec(x); If x<1 then inc(x); End;
      101,243:Begin If ye=false then ye:=true else ye:=false; End;
      102,224:Begin Gotoxy(1,16); Write('Выбор кисти...    ');kist:=readkey; End;
      115,251:Begin Assign(save, 'save.txt');  // Запись в файл
              rewrite(save);
              for i:=1 to yy do
              Begin
              For j:=1 to xx do
              If matrix[j,i]=' ' then Write(save, '&#12288;') else
              Write(save,matrix[j,i]);
              Writeln(save,'');
              End; 
              Close(save);
              End;
      103,239: Begin  fon:=readkey; //Fon
              For i:=1 to yy do //инициализация
              Begin 
              For j:=1 to xx do 
              If matrix[j,i]=' ' then matrix[j,i]:=fon;
              Writeln();
              End;
              
              
              end;
      99,241: Begin  //Clearall
              clrscr;
              For i:=1 to yy do //инициализация
              Begin 
              For j:=1 to xx do 
              matrix[j,i]:=' ';
              Writeln();
              End;              
              End;
    End;
    Gotoxy(1,yy+2);
    Writeln('Выбранный символ: ',kist);
    If ye=true then write('Вы рисуете.   ') else write('Вы не рисуете.   ');
    Writeln('Нажмите S чтобы сохранить в файл. (save.txt)');
    Writeln('Нажмите G для выбора фона.');
    Writeln('Нажмите C чтобы стереть всё.');
    
    Gotoxy(x, y);
    If ye=true then
    Begin
    matrix[x,y]:=kist;
    
    End;
    //Gotoxy(20,20);
    //Write(1);
    
    
  until ord(key) = 27;
end.