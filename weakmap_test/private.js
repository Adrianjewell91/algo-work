const privates = new WeakMap();

function Public(value) {
  const me = {
    value: value
    // Private data goes here
  };
  privates.set(this, me);
  console.log(privates);
}

Public.prototype.method = function () {
  const me = privates.get(this);
  console.log(me);
  // Do stuff with private data in `me`...
};

module.exports = {Public, privates} ;
