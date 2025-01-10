function transferOwnership(newOwner) {
  require(newOwner != address(0), "Ownable: new owner is the zero address");
  _transferOwnership(newOwner);
}

function _transferOwnership(newOwner) {
  address oldOwner = _owner;
  _owner = newOwner;
  emit OwnershipTransferred(oldOwner, newOwner);
}