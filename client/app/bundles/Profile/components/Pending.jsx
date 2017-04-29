import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

console.log('this is Pending motherfucker')

class Pending extends React.Component {
    render() {
      return this.props.pending.length ? this.props.pending.map(function(friend, i) {
        console.log(pending)
        return <Friend
          friend={friend}
          onRemove={() => this.props.onRemove(friend)}
          key={i}
          />
        }
      ) : null;
    }
}
export default Pending;