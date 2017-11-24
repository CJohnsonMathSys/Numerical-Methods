function recursion(a1,a2,c1,c2,maxStep)
    # function to solve the recusion problem specified by a1,a2,c1,c2
    # return array "a" containing calculated values
    a=[]
    push!(a,a1)
    push!(a,a2)
    for i=2:maxStep-1
        push!(a,c1*a[i]-c2*a[i-1])
    end
    return a
end

function mergepresorted(A::Array{Int64,1}, B::Array{Int64,1})
    # function to sort two arrays, A and B, of integers where each array is itslf in numerical order
    if length(A) == 0
        return B
    elseif length(B) == 0
        return A
    elseif A[1] < B[1]
        return vcat([A[1]], mergepresorted(A[2:end], B))
    else
        return vcat([B[1]], mergepresorted(A, B[2:end]))
    end    
end

function mergeSort(A::Array{Int64,1})
    # function to perfrom mergesort on integer array A, divide array into two separate arrays
    # recursively until array size =1
    n=length(A)
    if n == 1
        return A
    else 
        # split the array into two sub-arrays
        m=convert(Int64,0.5*n)
        return mergepresorted(mergeSort(A[1:m]), mergeSort(A[m+1:n]))
    end
end

