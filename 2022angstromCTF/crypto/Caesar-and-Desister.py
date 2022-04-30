'''
Caesar and Desister
After making dumb jokes about cryptography to all his classmates, clam got a cease and desist filed against him! When questioned in court, his only comment was "clam's confounding Caesar cipher creates confusing cryptographic challenges." Needless to say, the judge wasn't very happy. Clam was sentenced to 5 years of making dumb Caesar cipher challenges. Here's one of them: sulx{klgh_jayzl_lzwjw_ujqhlgyjshzwj_kume}.

Author: aplet123
'''
import string
def encode(m:str,offset:int):
	res = ""
	for c in m:
		c_ord:int = ord(c)
		if c_ord >= ord('a') and c_ord <= ord('z'):
			cur_offset = c_ord - ord('a')
			new_offset = (cur_offset + offset) % 26
			res += chr(new_offset + ord('a'))
		else:
			res += c
	
	return res
cipher = "sulx{klgh_jayzl_lzwjw_ujqhlgyjshzwj_kume}"

for offset in range(26):
	res = encode(cipher,offset)
	if "ctf" in res:
		print(res) # actf{stop_right_there_cryptographer_scum}