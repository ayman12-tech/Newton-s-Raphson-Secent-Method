%TASK 1
syms x; %using x as symbol
x0=input('Enter the initial value');
func=input('Enter the func');
xfinal=[];
for i=2:20
    y=vpa(subs(func,x,x0)); %f(x) finding
    y=double(y);
    z=diff(func);
    w=vpa(subs(z,x,x0)) %f'(x)
    w=double(w);
    xfinal(i)=x0-y/w;
    ea=abs(xfinal(i)-xfinal(i-1));
    error=abs(ea/xfinal(i))*100;
    
    fprintf('%d\t %f\t %f\t %e\t %e\t %e\t',i-1,x0,xfinal(i),y,w,error);
    fprintf('\n');
    
    if error==0
        break
    end
    
    x0=xfinal(i);%swap
end

%TASK 2
syms x;
x0 = input('Enter 1st approximation, x0: ');
x1 = input('Enter 2nd approximation, x1: ');

func=input('Enter the func:');
xfinal=[];

tol = input('Enter tolerance, tol:  ');
for i=2:20
    y=vpa(subs(func,x,x0)); %f(x) finding
    y=double(y);
    w=vpa(subs(func,x,x1)) %f(x)
    w=double(w);
    xfinal(i)=x1 - (((w)*(x0 - x1))/(y - w));
    z=vpa(subs(func,x,xfinal(i))); %f(x) finding
    z=double(z);
    ea=abs(xfinal(i)-xfinal(i-1));
    error=abs(ea/xfinal(i))*100;
   
    fprintf('%d\t %f\t %f\t %e\t %e\t %e\t',i-1,x0,x1,xfinal(i),z,error);
    fprintf('\n');
   
    if xfinal(i)<tol;
        break
    end
    x0=x1;
    x1=xfinal(i);
end

%TASK 3
%TIME COMPLEXITY AND BIG O of Newton's Raphson method:
T(n) = 2+4+(1+5+3)n+1
T(n) = 9n+7
Big O: O(n)

%TIME COMPLEXITY AND BIG O of Secent method:
T(n) = 3+2+13n+1
T(n) = 13n+6
Big O: O(n)

