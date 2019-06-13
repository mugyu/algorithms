# 3ŸSpline•âŠÔ
class Spline
  def initialize(x, y)
    @x = x
    @y = y
    n = x.size
    d = [0]

    1.upto(n) do |i|
      h[i] =  x[i] - x[i - 1]                          # ŠÔŠu
      d[i] = (y[i] - y[i - 1]) / h[i]                  # ˆêŸ”÷•ª
    end

    1.upto(n) do |i|
      d[i] = (d[i + 1] - d[i]) / (x[i + 1] - x[i - 1]) # “ñŸ”÷•ª
    end

    while x x[n - 1]
      x += 0.01
    end
  end

  def interpolate(t)
  end
end
   int i;
   double x,y,yy0,yy1,yy2,yy3;
   double[] h=new double[20];     //ŠÔŠu
   double[] dif1=new double[20];  //ˆêŸ”÷•ª
   double[] dif2=new double[20];  //“ñŸ”÷•ª

   h[0]=0.0;
   dif2[0]=0.0;
   dif2[data_count-1]=0.0; 

   Graphics g=getGraphics();
   g.setColor(new Color(0,192,192));  //dark cyan‚Åü‚ğˆø‚­

   i=1;
   for(x=dataX[0];x<dataX[data_count-1];x+=0.01){
      if(x<dataX[i]){
         yy0=dif2[i-1]/(6*h[i])*(dataX[i]-x)
            *(dataX[i]-x)*(dataX[i]-x);       //‘æ‚P€
         yy1=dif2[i]/(6*h[i])*(x-dataX[i-1])
            *(x-dataX[i-1])*(x-dataX[i-1]);   //‘æ‚Q€
         yy2=(dataY[i-1]/h[i]-h[i]*dif2[i-1]/6)
            *(dataX[i]-x);                    //‘æ‚R€
         yy3=(dataY[i]/h[i]-h[i]*dif2[i]/6)*
            (x-dataX[i-1]);                   //‘æ‚S€
         y=yy0+yy1+yy2+yy3;
         g.drawRect(X0+(int)(10*x),Y0+(int)(10*(40-y)),0,0);
      }
      else i++;
   }

}
