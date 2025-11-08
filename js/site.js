
const c=document.getElementById('stars');
if(c){const d=c.getContext('2d');let w=innerWidth,h=innerHeight;const N=220;
c.width=w;c.height=h;const s=[...Array(N)].map(()=>({x:Math.random()*w,y:Math.random()*h,z:Math.random()*1+0.2}));
function R(){d.clearRect(0,0,w,h);for(const p of s){d.fillStyle='rgba(255,255,255,'+(0.15+p.z/2)+')';d.fillRect(p.x,p.y,1+p.z,1+p.z);p.x+=0.1*p.z;if(p.x>w){p.x=0;p.y=Math.random()*h}}requestAnimationFrame(R)}R();addEventListener('resize',()=>{w=innerWidth;h=innerHeight;c.width=w;c.height=h});}
