function readList(L::Nullable{LList}) 
    # function to read a linked list (LList) and return the KVPairs in the list
  
    if isnull(L)
        # there is no further element in the list
        return
    else
        # still a lower branch
        println(get(L).data)
        return readList(get(L).next)
    end
end

function searchList(L::Nullable{LList}, k::Int64)
    # function to search the KVPairs in a linked list for an integer key k

    # check k against list key pair
    # if match return KVPair else move to next list element
    # if no more list elements then return nullable
    if (get(L).data.key == k)
        # found k, return KVPair
        return get(L).data
    else
        # not found k yet, progress along list
        if isnull(get(L).next)
            # next element does not exist, return the current element KVPair
            return get(L).data
        end    
        searchList(get(L).next,k)
    end
    
end

function intervalMembershipLList(L::Nullable{LList}, x::Float64)
    # function to search a linked list for the interval defined as a KVPair value that x Float64
    # lies within

    # if at end of the list and x > final data entry return error
    # if x is less than the current key data then contained in interval
    if (get(L).data.value > x)
        #  found interval containing x
        return get(L).data
    else
        # not found interval
        if isnull(get(L).next)
            # x is not contained within the interval set, return error
            return get(L).data
        end
        intervalMembershipLList(get(L).next,x)
    end
end

function intervalMembershipFTree(FT::Nullable{FTree},x::Float64)
    # function to search a Fenwick tree for the interval defined as a KVPair value that x Float64

    # if key = -1 then on a leaf, if not on leaf can get better estimate
    if (isnull(get(FT).right)&&isnull(get(FT).left))
        # on leaf, return value
        return get(FT).data
    else
        # on branch
        if (get(get(FT).left).data.value>=x)
            # then x in on right branch
            return intervalMembershipFTree(get(FT).left, x)
        else 
            # on the left branch or at the interval boundary
            y=get(get(FT).left).data.value
            return intervalMembershipFTree(get(FT).right, x-get(get(FT).left).data.value)
        end
    end
end


