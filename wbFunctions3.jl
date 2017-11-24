function bracketBisect(interval, func)
    # function to implement the bracket bisect algorithm on the interval and function specified
       ϵtol=0.5*(abs(interval[1])+abs(interval[2]))*eps(Float32)
    actual=log(pi)
    error=[]
    time=[]
    t=0
    while (interval[2]-interval[1]>ϵtol)
        x=(interval[1]+interval[2])*0.5
    
        if (func(interval[1])*func(x)>0)
        interval[1]=x
        else
            interval[2]=x
        end
        push!(error,abs(actual-x))
        push!(time,t)
        t=t+1
    end
    
    return time,error
end

function NewRaph(func,diff, ϵtol, guess)
    # use Newton Raphson method to find the root x of the function func
    x=guess
    estimates=[]
    time=[]
    t=0
    push!(estimates,x)
    push!(time,t)
    
    while abs(func(x))> ϵtol
        t=t+1
        δ=-func(x)/diff(x)
        x=x+δ
        push!(estimates,x)
        push!(time,t)
        
    end
    return estimates,time
end

function goldenSearch(interval, func, ϵtol)
    # function to implement the golden search algorithm for the minima of func within interval
    
    a=interval[1]
    b=interval[2]
    ϕ=0.5*(sqrt(5)-1.0)
    c=b-(b-a)/ϕ
    
    estimates=[]
    time=[]
    t=0
    while (abs(c-a)>ϵtol)
        
        if (abs(c-b)>abs(b-a))
            x=b+(1-ϕ)*(c-b)
            if (func(b)<func(x))
                a=a
                b=b
                c=x
            else
                a=b
                b=x
                c=c
            end
        else
            x=b-(1-ϕ)*(b-a)
            if (func(b)<func(x))
                a=x
                b=b
                c=c
            else
                a=a
                c=b
                b=x
            end
        end
        
    
        push!(estimates,x)
        push!(time,t)
        t=t+1 # new iteration       
        
    end
    
    
    return estimates,time
end
