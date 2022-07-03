export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'getNumber' : IDL.Func([], [IDL.Nat], ['query']),
    'topDown' : IDL.Func([IDL.Nat], [], ['oneway']),
    'topUp' : IDL.Func([IDL.Nat], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };
