close all
clear 
clc
format long
%***************************
% distance(center_leg)=8.22cm  M=14kg*m  height=100.8cm

%density unit=kg/m3
d_3d=1050;
d_al=2800;  
%assume use AISI 1045 as new material whose density is 7870 kg/m3

v_lower_al=(353769.796458137*2+92166.316155463 )*10^-9;

n_act=33;
n_l=5;
m_act=0.166;
m_act_total=33*m_act;
m_act_lower=23*m_act;
m_c=3;
m_total=10; % m is mass in kg.

m_3d_total=3.2;
m_3d_lowerlinks=2.110511404;
ratio_lower=m_3d_lowerlinks/m_3d_total*100;

v_3d_total=m_3d_total/d_3d;
v_3d_lower=m_3d_lowerlinks/d_3d;

shrinkratio_upper=0.5;
shrinkratio_lower=0.5; % with application of metal material, we can shrink the link volume and satistfy the performance requirement 

m_new_lowerlinks=v_3d_lower*d_al;
m_new_link_total=v_3d_total*d_al;
m_new_upperlinks=m_new_link_total-m_new_lowerlinks;
m_new_lowerlinks_real=v_lower_al*d_al;

m_new_lowerlinks_modified=m_new_lowerlinks*shrinkratio_lower;
m_new_link_total_modified=m_new_upperlinks*shrinkratio_upper+m_new_lowerlinks*shrinkratio_lower;

m_new_total=m_new_link_total+m_c+m_act_total;

m_new_total_modified=m_new_link_total_modified+m_c+m_act_total;

m_upperbody=m_new_upperlinks*shrinkratio_upper+m_c+5*0.016346830; % 5*brackets
m_lowerbody_real=m_new_lowerlinks_real+m_act_lower

m_real=m_upperbody+m_new_lowerlinks_real+m_act_total
weight_ratio=m_real/m_total