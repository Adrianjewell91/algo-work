def printMatrix(mat)
     for row in mat
         print row
         puts
     end
    puts
end

def calcLaplacian(n, respectList)
    laplacian=Array.new(n){Array.new(n, 0)}
    (0...respectList.length).each do |idx|
        laplacian[respectList[idx][0]][respectList[idx][1]]=-1
        laplacian[respectList[idx][1]][respectList[idx][0]]=-1
    end
    (0...n).each do |idx|
        laplacian[idx][idx]=-laplacian[idx].reduce(:+)
    end
    laplacian
end

def getMinor(laplacian, row, col)
    size=laplacian.length
    minor=Array.new(size-1){Array.new(size-1, 0)}
    (0...size).each do |idx1|
        (0...size).each do |idx2|
            if idx1!=row and idx2!=col
                curRow=idx1 if idx1<row
                curRow=idx1-1 if idx1>row
                curCol=idx2 if idx2<col
                curCol=idx2-1 if idx2>col
                minor[curRow][curCol]=laplacian[idx1][idx2]
            end
        end
    end
    minor
end

def findProductOfTrace(laplacian)
    product=1
    nrow=laplacian.length
    (0...nrow).each do |idx|
        product*=laplacian[idx][idx].abs
        product=(product).to_i%(10**9+7)
        puts "product= #{product}"
    end
    product
end

def modInverse(n, m)
    
    q=[]
    r=Array.new(2)
    s=Array.new(2)
    t=Array.new(2)
    
    r[0]=n
    r[1]=m
    
    s[0]=1
    s[1]=0
    
    t[0]=0
    t[1]=1
    
    while r[-1]!=0
        q << r[-2]/r[-1]
        r << r[-2]-q[-1]*r[-1]
        s << s[-2]-q[-1]*s[-1]
        t << t[-2]-q[-1]*t[-1]
    end
    
    if r[-2]!=1
        return -1
    end
    
    if s[-2]<0
        s[-2]+=m
    end
    
    s[-2]
end

def calcElimination(laplacian)
    nrow=laplacian.length
    (0...nrow).each do |row|
        (row+1...nrow).each do |row2|
            elem=10**9+7-laplacian[row2][row]
            if laplacian[row2][row]<0
                elem=-laplacian[row2][row]
            end
            scale=modInverse(laplacian[row][row], 10**9+7)*elem
            (row...nrow).each do |col|
                laplacian[row2][col]+=scale*laplacian[row][col]
                laplacian[row2][col]%=(10**9+7)
            end
        end
        #printMatrix(laplacian)
    end
    findProductOfTrace(laplacian)
end

def makeNewRespectList(n, respectList)
    respectList=[]
    (0...n).each do |idx1|
        (idx1+1...n).each do |idx2|
            if rand(0..1.0)<0.5
                respectList << [idx1, idx2]
            end
        end
    end
    respectList
end

def hierarchiesCount(n, respectList)
    #n=100
    #respectList=makeNewRespectList(n, respectList)
    return 1 if respectList.length==0
    return 2 if respectList.length==1
    laplacian=calcLaplacian(n, respectList)
    laplacian=getMinor(laplacian, 0, 0)
    determinant=calcElimination(laplacian)
    (determinant*n).to_i%(10**9+7)
end