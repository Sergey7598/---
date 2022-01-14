uses GraphABC, Events; //подключение необходимых модулей
//Поле - это участок молочного цвета, на котором рисуем замок и пульт
//  xf - абцисса верхнего левого угла поля
//  yf - ордината верхнего левого угла поля
//   s - ширина поля
//   h - высота поля
// xgl - абцисса верхней левой зеленой кнопки пульта
// ygl - ордината верхней левой зеленой кнопки пульта
// xgr - абцисса нижней правой зеленой кнопки пульта
// ygr - ордината нижней правой зеленой кнопки пульта
// xrl - абцисса верхней левой красной кнопки пульта
// yrl - ордината верхней левой красной кнопки пульта
// xrr - абцисса нижней правой красной кнопки пульта
// yrr - ордината нижней правой красной кнопки пульта
var xf,yf,s,h,xgl,ygl,xgr,ygr,xrl,yrl,xrr,yrr:integer;
   
procedure Fild(xf,yf,s,h:integer);
begin
  // рисуем поле
  SetBrushColor(clCornsilk);
  rectangle(xf,yf,xf+s,yf+h);
end;

procedure Panel(xf,yf,s,h:integer;  cl:boolean);
begin
  
  // рисуем каркас пульта
  SetBrushColor(clLavender);
  rectangle(xf+s-(s div 3),yf+h-(h div 3),xf+s,yf+h);
  
  // рисуем лампу
  // cl - состояние лампы 
  if cl then SetBrushColor(clGreen)
        else SetBrushColor(clRed);
  Circle(xf+s-((s div 3)div 2),yf+h-(h div 3),2*(h div 3)div 10);
  
  // рисуем кнопку включения
  SetBrushColor(clGreen);
  rectangle(xgl,ygl,xgr,ygr);
  
  // рисуем кнопку выключения
  SetBrushColor(clRed);
  rectangle(xrl,yrl,xrr,yrr);
end;

procedure Lock_Close(xf,yf,s,h:integer);
begin
  // рисуем душку замка
  setpenwidth(0);
  SetBrushColor(clDarkBlue);
  Circle(xf+(s div 2),yf+(h div 2)-(h div 10),(s div 10));
  SetBrushColor(clCornsilk);
  Circle(xf+(s div 2),yf+(h div 2)-(h div 10),4*(s div 10) div 5);
  
  // рисуем нижнюю часть замка
  SetBrushColor(clBrown);
  rectangle(xf+(s div 2)-(s div 10),yf+(h div 2)-(h div 9),xf+(s div 2)+(s div 10),yf+(h div 2)+(h div 9));
end;

procedure Lock_Open(xf,yf,s,h:integer);
begin
  // рисуем душку замка
  setpenwidth(0);
  SetBrushColor(clDarkBlue);
  Circle(xf+(s div 2)-2*(s div 10)+1*(s div 10) div 5,yf+(h div 2)-(h div 10),(s div 10));
  SetBrushColor(clCornsilk);
  Circle(xf+(s div 2)-2*(s div 10)+1*(s div 10) div 5,yf+(h div 2)-(h div 10),4*(s div 10) div 5);
  SetPenColor(clCornsilk);
  rectangle(xf+(s div 2)-3*(s div 10),yf+(h div 2)-(h div 9),xf+(s div 2)+(s div 10),yf+(h div 2)+(h div 9));
  
  // рисуем нижнюю часть замка
  SetPenColor(clBlack);
  setpenwidth(1);
  SetBrushColor(clBrown);
  rectangle(xf+(s div 2)-(s div 10),yf+(h div 2)-(h div 9),xf+(s div 2)+(s div 10),yf+(h div 2)+(h div 9));
end;

procedure MouseDown(x,y,mb: integer);
begin   
  if (x>=xgl) and (x<=xgr) and (y>=ygl) and (y<=ygr) and (mb=1)then
  begin
    Clearwindow(clBlack);
    Fild(xf,yf,s,h);
    Panel(xf,yf,s,h,true);
    Lock_Open(xf,yf,s,h)
  end
  else
  if (x>=xrl) and (x<=xrr) and (y>=yrl) and (y<=yrr) and (mb=1)then
  begin
    Clearwindow(clBlack);
    Fild(xf,yf,s,h);
    Panel(xf,yf,s,h,false);
    Lock_Close(xf,yf,s,h)
  end      
end;

begin  
  xf:=100;
  yf:=100;
  s:=1000;
  h:=500;
  
  xgl:= xf+s-(9*(s div 3) div 10);
  ygl:=yf+h-(4*(h div 3)div 10);
  xgr:=xf+s-(6*(s div 3) div 10);
  ygr:=yf+h-(2*(h div 3)div 10);
  
  xrl:=xf+s-(4*(s div 3) div 10);
  yrl:=yf+h-(4*(h div 3)div 10);
  xrr:=xf+s-(1*(s div 3) div 10);
  yrr:=yf+h-(2*(h div 3)div 10);
  
  MaximizeWindow;
  Clearwindow(clBlack);
  Fild(xf,yf,s,h);
  Panel(xf,yf,s,h,false);
  Lock_Close(xf,yf,s,h);
  
  While True do
    OnMouseDown:=MouseDown 
end.