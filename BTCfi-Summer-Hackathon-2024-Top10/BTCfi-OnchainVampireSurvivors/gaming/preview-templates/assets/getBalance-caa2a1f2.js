import{aa as r,bE as n}from"./index-0c28943e.js";import{getCurrencyMetadata as c}from"./getCurrencyMetadata-4fc20e63.js";import"./decimals-56827638.js";const s="0x70a08231",o=[{type:"address",name:"_address"}],d=[{type:"uint256"}];async function m(a){return r({contract:a.contract,method:[s,o,d],params:[a.address]})}async function y(a){const[t,e]=await Promise.all([m(a),c(a)]);return{...e,value:t,displayValue:n(t,e.decimals)}}export{y as getBalance};
