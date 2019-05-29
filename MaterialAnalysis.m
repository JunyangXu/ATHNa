close all
clear 
clc
format long

%density unit=kg/m3
d_act=1989;
d_3d=1050;
d_new_link=7870;  
%assume use AISI 1045 as new material whose density is 7870 kg/m3

v_act=83600*10^-9;

n_act=33;
n_l=5;
m_act=v_act*d_act;
m_actl=33*m_act+5*0.016346830;
m_c=1.5;
m_total=10.6; % m is mass in kg.

m_3d_total=m_total-m_c-m_actl
m_3d_lowerlinks=2.110511404
ratio_lower=m_3d_lowerlinks/m_3d_total*100

v_3d_total=m_3d_total/d_3d;
v_3d_lower=m_3d_lowerlinks/d_3d;

shrinkratio_upper=0.35;
shrinkratio_lower=0.5; % with application of metal material, we can shrink the link volume and satistfy the performance requirement 

m_new_lowerlinks=v_3d_lower*d_new_link
m_new_link_total=v_3d_total*d_new_link
m_new_upperlinks=m_new_link_total-m_new_lowerlinks;

m_new_lowerlinks_modified=m_new_lowerlinks*shrinkratio_lower
m_new_link_total_modified=m_new_upperlinks*shrinkratio_upper+m_new_lowerlinks*shrinkratio_lower

m_total
m_new_total=m_new_link_total+m_c+m_actl

m_new_total_modified=m_new_link_total_modified+m_c+m_actl
weight_ratio=m_new_total_modified/m_total