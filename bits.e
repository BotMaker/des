--include misc.e

sequence places,binary
places={}--{power(2,16),power(2,15),power(2,14),power(2,13),power(2,12),power(2,11),power(2,10),power(2,9),power(2,8),power(2,7),power(2,6),power(2,5),power(2,4),power(2,3),power(2,2),power(2,1),1}

for i=32 to 1 by -1 do
  places&=power(2,i)
end for
places&=1




global function dec_to_binary(atom val)
atom num
integer fn,step
step=0
num=0

binary=repeat(0,length(places))

for i=1 to length(places) do
  
  num+=places[i]

  if val>=num then
    binary[i]=1
  end if

  if num>val then
    num-=places[i]
  end if
  
end for

if binary[1]=1 then
 ?places
 ?binary
 sleep(4)
end if


--fn=open("bin.txt","w")
--  for i=2 to length(binary) do
--    step+=1
--    puts(fn,sprint(binary[i]))
--    if step=4 then
--      step=0
--      puts(fn,"  ")
--    end if

--  end for
--close(fn)


  return binary[2..length(binary)]

end function

global function binary_to_dec(sequence bits)
atom num,fn
num=0


for i=1 to length(bits) do
  
  if bits[i]=1 then
    num+=places[ (length(places)-length(bits)) +(i)]
  end if


end for

--fn=open("bin.txt","w")
--   puts(fn,sprint( num ))
--close(fn)
  return num
end function

--?binary_to_dec({1,1,1,1})
--?dec_to_binary(7)
--sleep(3)

