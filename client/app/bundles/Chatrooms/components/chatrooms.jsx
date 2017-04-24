import PropTypes from 'prop-types';
import React from 'react';

import Chatbar from './Chatbar.jsx';
import Messages from './Messages.jsx';

export default class Chatrooms extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props);

    this.state = { name: this.props.name };
    // this.state = { name: this.props.name }; FROM HELLO WORLD EXAMPLE
  }

  render() {
    return (
     <div>
        <h3>
          Holla, {this.state.name}!
          // <Messages />
          // <Chatbar />
        </h3>
      </div>

    )
  }
}
